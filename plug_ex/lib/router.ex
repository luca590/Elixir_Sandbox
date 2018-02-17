defmodule PlugEx.Router do
  use Plug.Router

  plug :match   #allows to match route
  plug :dispatch  #then dispatch code - like pattern matching

  #needs to add after match/dispatch
  plug Plug.Static, at: "/home", from: :server   #static html, file comes from server

  #server will look at connection and match route
  get "/" do
    send_resp(conn, 200, "HelloWorld")
  end

  get "/home" do  #correspond with GET requests in html - can also use PUT
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> send_file(200, "lib/index.html")

    #conn = put_resp_content_type(conn, "type/html")
    #send_file(conn, 200, "lib/index.html")
  end

  match _, do: send_resp(conn, 404, "404 - error not found!")    #match everything else and respond with not found

end


