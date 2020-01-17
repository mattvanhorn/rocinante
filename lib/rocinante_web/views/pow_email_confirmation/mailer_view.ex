defmodule RocinanteWeb.PowEmailConfirmation.MailerView do
  use RocinanteWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
