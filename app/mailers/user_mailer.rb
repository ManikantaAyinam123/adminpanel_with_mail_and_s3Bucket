class UserMailer < ApplicationMailer
    default from: 'manikantaayinam2000@gmail.com' # Replace with your email address

    def welcome_email(user)
      @user = user
   mail(to: @user.email, subject: 'Welcome to Your App!')
    end
    def post_created(user, post)
      
        @user = user
        @post = post
        mail(to: @user.email, subject: 'New Post Created!')
      end

end
