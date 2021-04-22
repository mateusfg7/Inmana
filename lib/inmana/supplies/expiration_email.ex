defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@inmana.com.br",
      subject: "Supplies that are about to expire",
      html_body: email_html(supplies),
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "----- Supplies that are about to expire: -----\n"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "\nDescription: #{description}\nExpiration Date: #{expiration_date}\nResponsible #{
      responsible
    }\n\n"
  end

  defp email_html(supplies) do
    title = "<h2 style='font-family: Arial;'>Supplies that are about to expire:</h2>"

    Enum.reduce(supplies, title, fn supply, text -> text <> supply_html_string(supply) end)
  end

  defp supply_html_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "<div style='font-family: Arial; padding: 10px; border: 1px solid black; margin-bottom: 10px; line-height: 6px; border-radius: 8px;'>
    <p><strong>Description:</strong> <i>#{description}</i></p>
    <p><strong>Expiration Date:</strong> <i>#{expiration_date}</i></p>
    <p><strong>Responsible:</strong> <i>#{responsible}</i></p>
  </div>"
  end
end
