class ContactMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def contact_email(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @reason = params[:reason]
    @message = params[:message]
    @file = params[:file]

    attachments[@file.original_filename] = File.read(@file.tempfile) if @file

    mail(from: @email, to: ENV['MAILJET_EMAIL'], subject: 'Nouveau message de contact')
  end
end
