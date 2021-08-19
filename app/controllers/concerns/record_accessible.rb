module RecordAccessible
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveSupport::RecordNotFound, with: ->{ render(json: { error: "Not Found"}, status: 404)}
    rescue_from ActiveSupport::RecordInvalid, with: ->{ render(json: { error: "Bad Request"}, status: 400)}
  end
end