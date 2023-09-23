defmodule Zoom.Auth.Token do
  use Joken.Config

  alias Zoom.Auth

  def generate(%Auth{
        topic: topic,
        user_identity: user_identity,
        password: password,
        role_type: role_type
      }) do
    sdk_key = Application.get_env(:zoom_ex, :zoom_sdk_key)

    case generate_and_sign(%{
           app_key: sdk_key,
           tpc: topic,
           role_type: role_type,
           # session_key: session_key
           user_identity: user_identity,
           version: 1,
           pwd: password
         }) do
      {:ok, token, _claims} ->
        token

      error ->
        IO.inspect(error: error)
        {:error}
    end
  end
end
