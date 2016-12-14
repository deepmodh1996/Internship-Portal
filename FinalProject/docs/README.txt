
Pre-requisites :
	1. We need mysql2 (version between 0.3 to 0.5)
	2. Ruby 2.3 or higher is to be installed on the Linux system.
	3. Run command ‘gem install rails’. 
	4. Running the command ‘rails --version’ should now show a version of at least 5.0.0.

Setting-up :
	5. Go to terminal and open mysql.
	6. Run 2 commands.
mysql> create database company_development;
mysql> grant all privileges on company_development.* to 'companyAdmin'@'localhost' identified by 'password';

	7. Now extract the project folder ‘company’ and open it in terminal
	8. Now run command ‘bundle install’
	9. Run the command ‘rake db:migrate’
	10. Run command ‘mysql -u root -p company_development < script.sql’

Running Project :
	11. Run command ‘rails server’. Rail server has url http://localhost:3000/ which is Login screen.
	12. Sign up student and you are good to go.



Explanation of Interface :

http://localhost:3000/	
This login and password can be generated via the ‘Sign Up’ option where a student registers himself/herself. We are then able to log in and see the home page for the student. We see a summary of his placement details. We see an index of IAF’s he has signed so far, their status, etc. once his resume is uploaded and then verified by the admin. We can edit the personal details of the student, allow the student to ‘sign’ or ‘unsign’ the IAF, and show his results for each IAF. When an IAF is signed, this student entry is added to shortlisted students table so that company is able to see the name of student under the corresponding IAF.
The student can upload his resume using the home tab and then click on ‘upload resume’. In the resumes tab the student is able to add points to be verified using ‘Add point’ button.
The status of these points is shown as ‘pending’ beside each point until the points are reviewed and verified by the admin. 
When the student is selected in a company, (s)he would see the status as ‘Selected for the company XYZ’ and his/her name would be removed from the shortlist relation for all other IAFs.



Here, we similarly see the home page of the company after clicking on the button company login. (The login for company can be implemented similar to student login but hasn’t been implemented here)
We see a list of IAF’s the company has added. The company can add new IAF’s, view the existing IAF’s and edit them as well until freezed. The company can also see the list of students who have ‘signed’ for the company by clicking on IAF and then Signed students link inside the IAF. The company can shortlist the students by a link ‘Shortlist’ after every student entry. This basically modifies status attribute value in a tuple to the relation ‘shortlists’. Hence once the company clicks on ‘shortlist’ against the names of few students, and then clicks on ‘Freeze shortlist’ then the result of the IAF gets frozen. Thus no students will be able to see this IAF in their home or IAF tab.
Also, the tuples corresponding to this student which were added to shortlists table will get removed from the signed students list from all other IAFs to prevent the selection of same student in 2 or more places.


Setting up admin :
	   c) From the same link http://localhost:3000/ 
 we can log in as an admin if admin privilege is added to that particular user (i.e. student) via mysql command line (Make the value of admin field of that student equal to 1 )	
So to create admin, we first need to sign up as student. After this, we can run sql command which changes the ‘admin’ attribute of this student as described above.
Now if the admin logs in like a student, he/she is able to get all the admin privileges.
Query : ‘UPDATE students SET admin = true WHERE id = id_of_admin;’ 


We can see all the IAF’s added so far to the system, the list of companies and students registered, etc. S(he) is able to add/view/edit entries in any of the relations. The paths are much similar to the paths in company/student login. 
More importantly we can verify the resumes of students who sign up and upload their resumes. Until the admin verifies the student resume’s, the student won’t be able to see/sign IAF’s using that resume.