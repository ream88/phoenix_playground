#!/usr/bin/env elixir
Mix.install([
  {:phoenix_playground, "~> 0.1.0", github: "phoenix-playground/phoenix_playground"}
])

defmodule DemoLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def render(assigns) do
    ~H"""
    <span><%= @count %></span>
    <button phx-click="inc">+</button>
    <button phx-click="dec">-</button>

    <style type="text/css">
      body { padding: 1em; }
      span { font-family: monospace; }
    </style>
    """
  end

  def handle_event("inc", _params, socket) do
    {:noreply, assign(socket, count: socket.assigns.count + 1)}
  end

  def handle_event("dec", _params, socket) do
    {:noreply, assign(socket, count: socket.assigns.count - 1)}
  end
end

PhoenixPlayground.start(live: DemoLive)
