defmodule TlsWeb.LiveSigil do
  use TlsWeb, :live_view

  def render(assigns) do
    ~V"""
    <script>
      export let number = 5
      let other = 1

      $: combined = other + number
    </script>

    <p>This is number: {number}</p>
    <p>This is other: {other}</p>
    <p>This is other + number: {combined}</p>

    <button phx-click="increment">+number</button><br />
    <button on:click={() => other += 1}>+other</button>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :number, 1)}
  end

  def handle_event("increment", _value, socket) do
    {:noreply, assign(socket, :number, socket.assigns.number + 1)}
  end
end
