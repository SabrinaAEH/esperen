class ContactsController < ApplicationController
  def show
  end

  def create
    # Récupérer les données du formulaire
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    reason = params[:reason]
    message = params[:message]
    file = params[:file]

    # Appeler le mailer pour envoyer l'email
    ContactMailer.contact_email({
      first_name: first_name,
      last_name: last_name,
      email: email,
      reason: reason,
      message: message,
      file: file
    }).deliver_now

    # Rediriger ou retourner une réponse selon vos besoins
    redirect_to root_path, notice: 'Votre message a été envoyé.'
  end
end
