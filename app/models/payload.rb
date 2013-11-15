module Payload
  def from_service(service_name)
    "Payload::#{service_name.camelize}".constantize
  end
end
