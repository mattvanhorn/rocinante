defmodule RocinanteWeb.PowInvitation.MailerView do
  use RocinanteWeb, :mailer_view

  def subject(:invitation, _assigns), do: "You've been invited"
end
