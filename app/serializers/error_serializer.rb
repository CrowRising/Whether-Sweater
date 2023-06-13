class ErrorSerializer

  def initialize(error)  
    @error = error
  end

  def error_message
    {
      errrors: [
        {
          details: @error.message,
          status: @error.status
        }
      ]
    }
  end
end