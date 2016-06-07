AEL Management Setup
--------------------------
Environment setup - What you need?
1. Java7
2. Eclipse with m2e plugin
3. Tomcat 7
4. MySQL with root account and empty password (update pom.xml if you want to connect with other account/password)
--------------------------
Steps:
1. Check out project into local folder
2. Import it in to Eclipse as Maven project
3. Right click on imported project -> Maven -> Update Project
4. Create ael schema 
5. Run script InitDB.sql
6. Deploy your project on Tomcat server
7. Start server and access http://localhost:8080/AELManagement

---------------------------
Account to login
1. admin/admin: ROLE_ADMIN

Then you could go to Quan Ly Nguoi Dung to see list of all users. Password for these users are 123456

2. Check TinhNangHeThongAEL.xlsx for system functionalities

