github link: https://github.com/ssaleem1/cs4550-webDev/tree/master/microblog

deployed link: http://microblog.ssaleem.me

Have tested that my VPS can reboot and bring up my server on its own using the systemd service file. I've included said file as microblog.service.
As well as my nginx reverse proxy file which is named microblog.conf.

Navigation Tips:
There are two user accounts that I have already created for your convenience
	- a@a.com
	- b@b.com

Use one of those to login using the form in the top right of the nav bar. Once you login, you will see that the login form has been replaced with your email and an option to log out. 

If you are not signed in, you will see less functionality

In the event that you need to create a new user for some reason, go to: http://microblog.ssaleem.me/users/new

Clicking on the "BadTwitter" button on the top left of the navbar will always take you to the home page in case you get lost

Once you are logged in, clicking logout on the top right will log you out...


Posting:
	- Once you are logged in, you should see "Create new post" button on the homepage
	- This will take you to a form where you can enter the text of your post and press submit
	- Now, when you return to the homepage you will see your post added to the list of posts

Looking at posts on the homepage:
	- You will notice that you are only allowed to delete/edit your own tweets
	- for all tweets that are not posted by you, you will not see the delete/edit options

Following Someone:
	- From the homepage, you can click on any user's email from the list of posts and it will take you to their profile
	- YOU MUST go to a profile that is NOT your own to be able to see the follow button on the page
		- For example, If you are logged in as a@a.com, then you will only see the follow if you are on a profile that is not a@a.com (like b@b.com)
	- Clicking the follow button on the user's profile page will give you a success message
	- Now, if you ever go to this person's profile page again, you will see that the Follow button has been replaced with a "you are following this person" text

