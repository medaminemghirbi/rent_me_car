class OffreJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "bonjour"
  end
end
