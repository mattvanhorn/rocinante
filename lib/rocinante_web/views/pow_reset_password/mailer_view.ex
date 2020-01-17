defmodule RocinanteWeb.PowResetPassword.MailerView do
  use RocinanteWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
