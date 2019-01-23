class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_item = req.path.split("/items/").last
      item = @@items.find{|s| s.name == search_item}
      item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
