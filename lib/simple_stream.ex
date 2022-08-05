defmodule SimpleStream do
  @moduledoc """
  Documentation for `SimpleStream`.
  """
  @type partition_id_t :: String.t()
  @type event_t :: term
  @type event_id_t :: term()
  @opaque offset_t :: :beginning | event_id_t()
  @type stream_t :: Enumerable.t()

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      {otp_app, adapter, config} = Swoosh.Mailer.parse_config(__MODULE__, opts)

      @adapter adapter
      @config config

      def __adapter__, do: @adapter

      def init, do: @adapter.init()
      def append(partition_id, event), do: @adapter.append(partition_id, event)

      # Shamelessly stolen from Swoosh
      def parse_config(stream_backend, opts) do
        otp_app = Keyword.fetch!(opts, :otp_app)
        config = Application.get_env(otp_app, stream_backend, [])
        adapter = opts[:adapter] || config[:adapter]

        unless adapter do
          raise ArgumentError,
                "missing :adapter configuration in " <>
                  "config #{inspect(otp_app)}, #{inspect(stream_backend)}"
        end

        {otp_app, adapter, config}
      end
    end
  end
end
