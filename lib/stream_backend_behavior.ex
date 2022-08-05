defmodule SimpleStream.Backend.Behavior do
  @callback init() :: :ok | {:error, term()}
  @callback append(SimpleStream.partition_id_t(), SimpleStream.event_t(), Keyword.t()) ::
              :ok | {:error, term()}
  @callback open_as_stream(SimpleStream.partition_id_t(), SimpleStream.offset_t()) ::
              {:ok, SimpleStream.stream_t()}
              | {:error, :invalid_partition}
              | {:error, :invalid_offset}
              | {:error, term()}
end
