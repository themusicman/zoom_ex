defmodule Zoom.Auth.VideoSdk.Token do
  use Joken.Config
  require Logger
  alias Zoom.Auth

  def generate(%Auth{
        topic: topic,
        user_identity: user_identity,
        password: password,
        role_type: role_type,
        session_key: session_key
      }) do
    sdk_key = Application.get_env(:zoom_ex, :zoom_sdk_key)

    claims = %{
      app_key: sdk_key,
      tpc: topic,
      role_type: role_type,
      user_identity: user_identity,
      version: 1,
      pwd: password
    }

    claims =
      if session_key do
        Map.put(claims, :session_key, session_key)
      else
        claims
      end
      |> Flamel.Map.stringify_keys()

    case generate_and_sign(claims, :zoom_ex) do
      {:ok, token, _claims} ->
        token

      error ->
        Logger.debug("Zoom.Auth.VideoSdk.Token.generate_and_sign error=#{inspect(error)}")
        {:error}
    end
  end
end
