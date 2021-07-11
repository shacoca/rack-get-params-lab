class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/cart/)
      if @@cart.empty?
        resp.write "Your cart is empty"
      else
        resp.write @@cart.join("\n")
      end

    elsif req.path.match(/add/)
      item = req.params["item"]
      # binding.pry
      if @@items.include?(item)
        @@cart << item
        resp.write "added #{item}"
      else
        resp.write "We don't have that item"

      end

    else
      resp.write "Path Not Found"

    end

    resp.finish

  end
end
