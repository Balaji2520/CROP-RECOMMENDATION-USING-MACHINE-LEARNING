from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
import os
import shutil
from werkzeug.utils import secure_filename
from werkzeug.datastructures import  FileStorage
import mysql.connector
import sys
import glob
import pandas as pd
from sklearn.svm import SVC
import numpy as np
import sys
from datetime import date 
from datetime import datetime
import smtplib
from csv import reader
lst=[]
app = Flask(__name__)
db=mysql.connector.connect(user='root', database='crop')

def read_file(filename):
    with open(filename, 'rb') as f:
        photo = f.read()
        sys.setdefaultencoding('utf-8')
    return photo

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/userhome')
def userhome():
   
    return render_template('userhome.html')

@app.route('/adminhome')
def adminhome():
   
    return render_template('adminhome.html')

@app.route('/userregister')
def userregister():
    return render_template('registration.html')

@app.route('/upload')
def upload():
    return render_template('upload.html')


@app.route('/aboutus')
def aboutus():
    return render_template('aboutus.html')

@app.route('/feedback')
def feedback():
    return render_template('feedback.html')


@app.route('/userlogin')
def userlogin():
    return render_template('index.html')


@app.route('/Recommend')
def Recommend():
    return render_template('Recommend.html')



@app.route('/UploadImage')
def createplan():
    return render_template('UploadImage.html')

@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/adminlogin')
def adminlogin():
    return render_template('index.html')

@app.route('/addplaces')
def addplaces():
    return render_template('addplaces1.html')


@app.route('/userregisterdb', methods=['POST'])
def do_userregisterdb():
    uid=request.form['userid']
    name=request.form['name']
    email=request.form['email']
    phno=request.form['phno']
    area=request.form['area']
    password=request.form['password']
    
    
    cursor = db.cursor()
    cursor.execute('insert into users values("%s", "%s", "%s", "%s", "%s","%s")' % \
             (uid,name,email,phno,area,password))
    db.commit()
    
    return render_template('index.html',msg="Registered Successfully")

    
@app.route('/login', methods=['POST'])
def do_login():
    flag=False
    cursor = db.cursor()
    username=request.form['username']
    password=request.form['password']
    sql = "SELECT * FROM users WHERE userid= '%s' and password = '%s' " % (username,password)
    print("Sql  is ",sql)
    rows_count = cursor.execute(sql)
    data = cursor.fetchall()
    if len(data) > 0:
        session['logged_in'] = True
        session['uid'] = username
        flag=True
    else:
        flag=False
    if flag:
        return render_template('userhome.html',msg="User Login Successfully")
    else:
        return render_template('index.html',msg="Username/password not Match")

#admin module starts

@app.route('/adminlogin', methods=['POST'])
def do_adminlogin():
    flag=False
    ##print ("Admin Login")
    username=request.form['username']
    password=request.form['password']
    if username=='admin' and password=='admin':
        session['logged_in'] = True
        flag=True
    else:
        flag=False
    if flag:
        return render_template('adminhome.html',msg="Login success")
    else:
        return render_template('index.html')


@app.route('/viewfeedback')
def do_viewfeedbackdb():
    ##print ("Welcome feedback view")
    cursor = db.cursor()
    
    sql = "SELECT users.userid,name,feedback,date,time FROM users,feedback where users.userid=feedback.userid"
    rows_count = cursor.execute(sql)
    data = cursor.fetchall()
    return render_template('viewfeedback.html',ddata=data)


@app.route('/recommedDB',methods=['POST'])
def do_Recommenddb():

    import pandas as pd
    import numpy as np
    v1=float(request.form['t1'].strip())
    v2=float(request.form['t2'].strip())
    v3=float(request.form['t3'].strip())
    v4=float(request.form['t4'].strip())
    v5=float(request.form['t5'].strip())
    v6=float(request.form['t6'].strip())
    v7=float(request.form['t7'].strip())
    v8=float(request.form['t8'].strip())
    v9=request.form['t9'].strip()
    v10=float(request.form['t10'].strip())
    # Reading the Dataset
    cropdf = pd.read_csv("dataset.csv")

    # Print some sample data from dataset
    cropdf.head()
    mean_value=cropdf['N'].mean()
    cropdf['N'].fillna(value=mean_value, inplace=True)

    mean_value=cropdf['P'].mean()
    cropdf['P'].fillna(value=mean_value, inplace=True)

    mean_value=cropdf['K'].mean()
    cropdf['K'].fillna(value=mean_value, inplace=True)

    mean_value=cropdf['temperature'].mean()
    cropdf['temperature'].fillna(value=mean_value, inplace=True)

    mean_value=cropdf['humidity'].mean()
    cropdf['humidity'].fillna(value=mean_value, inplace=True)

    mean_value=cropdf['ph'].mean()
    cropdf['ph'].fillna(value=mean_value, inplace=True)

    mean_value=cropdf['rainfall'].mean()
    cropdf['rainfall'].fillna(value=mean_value, inplace=True)

    mean_value=cropdf['Area'].mean()
    cropdf['Area'].fillna(value=mean_value, inplace=True)

    mean_value=cropdf['Production'].mean()
    cropdf['Production'].fillna(value=mean_value, inplace=True)

    cropdf["Season"].fillna("Kharif", inplace = True)

    sea=0
    if v9=='Kharif':
        sea=1
    elif v9=='Autumn':
        sea=2
    elif v9=='Rabi':
        sea=3
    elif v9=='summer':
        sea=4
    elif v9=='winter':
        sea=5
    elif v9=='Whole Year':
        sea=6
    cropdf['Season']=cropdf['Season'].str.strip()
    cropdf['Season'] = cropdf['Season'].replace('Kharif',1)
    cropdf['Season'] = cropdf['Season'].replace('Autumn',2)
    cropdf['Season'] = cropdf['Season'].replace('Rabi',3)
    cropdf['Season'] = cropdf['Season'].replace('summer',4)
    cropdf['Season'] = cropdf['Season'].replace('winter',5)
    cropdf['Season'] = cropdf['Season'].replace('Whole Year',6)
    print("Dataset is ")
    print(cropdf.head())
  
    cropdf.reset_index()
    # Extract only parametres and drop end results
    X = cropdf.drop('label', axis=1)
  
    # Extract only end results 
    y = cropdf['label']


    # import library to split training and testing data
    from sklearn.model_selection import train_test_split

    # X_train - Training Dataset
    # y_train - Expected Training Results

    # X_test - Testing Dataset
    # y_test - Expected Testing Results

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.3,
                                                        shuffle = True, random_state = 0)


    # Creating a lightgbm model
    import lightgbm as lgb

    model = lgb.LGBMClassifier()

    # Training the model using Training Data
    model.fit(X_train, y_train)


    # Predicting the outputs over testing data
    y_pred=model.predict(X_test)


    # Library to measure accuracy of model
    from sklearn.metrics import accuracy_score

    # Find accuracy on Expected Output and Predicted Output on Testing Data
    accuracy=accuracy_score(y_pred, y_test)
    print('LightGBM Model accuracy score: {0:0.4f}'.format(accuracy_score(y_test, y_pred)))


    # Find Training Score on Expected Output and Predicted Output on Training Data
    y_pred_train = model.predict(X_train)
    print('Training-set accuracy score: {0:0.4f}'. format(accuracy_score(y_train, y_pred_train)))

    # Predicting crop based on trained model

    #x=model.predict([[90, 42, 43, 20.879744, 75, 5.5,220]])
    x=model.predict([[v1, v2, v3, v4, v5, v6,v7, v8, float(sea),v10]])
    print(x)


    return render_template('viewrecommend.html',ddata=x)


@app.route('/viewadminfeedback')
def do_viewadminfeedbackdb():
    ##print ("Welcome feedback view")
    cursor = db.cursor()
    
    sql = "SELECT users.userid,name,feedback,date,time FROM users,feedback where users.userid=feedback.userid"
    rows_count = cursor.execute(sql)
    data = cursor.fetchall()
    return render_template('viewadminfeedback.html',ddata=data)


@app.route('/viewplaces')
def do_viewplacesdb():
    
    with open("dataset.csv","r",encoding='unicode_escape') as obj:
        csv_reader=reader(obj)
        lst=list(csv_reader)

    return render_template('viewjurys.html',ddata=lst)

@app.route('/ViewSelectedJury')
def do_ViewSelectedJurydb():
    cursor = db.cursor()
    print("Welcome")
    sql = "SELECT DISTINCT competition FROM jurydetails"
    rows_count = cursor.execute(sql)
    data = cursor.fetchall()
    print(len(data))
    print(data)
    return render_template('viewselectedjury.html',ddata=data)



@app.route('/profile')
def profiledb():
    
    cursor = db.cursor()
    uid=session['uid']
    
    sql = "SELECT userid,name,password,area,email,phno FROM users where userid='%s'" % (uid)
    rows_count = cursor.execute(sql)
    data = cursor.fetchall()
    if len(data) > 0:
        return render_template('profile.html',ddata=data)



@app.route('/viewusers')
def viewusersdb():
    
    cursor = db.cursor()
    
    sql = "SELECT userid,name,email,phno,area FROM users"
    rows_count = cursor.execute(sql)
    data = cursor.fetchall()
    if len(data) > 0:
        return render_template('viewusers.html',ddata=data)


@app.route('/userfeedbackdb', methods=['POST'])
def do_userfeedbackdb():
    userid=request.form['userid']
    feedback=request.form['feedback']
    today = date.today()
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    cursor = db.cursor()
    cursor.execute('insert into feedback(userid,feedback,date,time) values("%s", "%s","%s","%s")' % \
             (userid,feedback,today,current_time))
    db.commit()
    return render_template('userhome.html',msg="Thank You for Your Valueable FeedBack")


@app.route('/addplacesdb', methods=['POST'])
def do_addplacesdb():
    name=request.form['name']
    email=request.form['email']
    phno=request.form['phno']
    uname=request.form['username']
    password=request.form['password']
    cursor = db.cursor()
    cursor.execute('insert into patient values("%s", "%s", "%s", "%s", "%s")' % \
             (name,email,phno,uname, password))
    db.commit()
    return render_template('patientlogin.html')

#admin module starts

@app.route('/uploadDB', methods=['POST'])
def do_uploadDB():
    f = request.files['files']
    df = pd.read_csv(f,encoding='cp1252')
    df.to_csv("dataset.csv",index=False)
    return render_template('adminhome.html',msg="File UploadedSuccessfully")

#admin module Ends
@app.route("/logout")
def logout():
    session['logged_in'] = False
    return home()

 
if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True,host='0.0.0.0', port=8000)
