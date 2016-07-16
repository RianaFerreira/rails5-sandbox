class IdeaBroadcastJob < ApplicationJob
  queue_as :default

  def perform(idea)
    ActionCable.server.broadcast 'idea_channel', idea: render_idea(idea)
  end

  private def render_idea(idea)
    ApplicationController.renderer.render(partial: 'ideas/idea', locals: {idea: idea})
  end
end
