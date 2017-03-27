def logged_in?
  #!!session[:user_id]
  !!current_user_id
end

def current_user_id
  @current_user ||= User.find_by(id: session[:user_id])
end

def get_time_ago(time)

  seconds = Time.now - time

  if seconds < 60
    return "#{seconds} seconds ago"
  elsif seconds / 60 < 60
    return "#{(seconds / 60).to_i} minutes ago"
  elsif seconds / 60 / 60 < 24
    return "#{(seconds / 60 / 60).to_i} hours ago"
  elsif seconds / 60 / 60 < 48
    return "yesterday"
  else
    return "on " + time.strftime("%y/%d/%m")
  end

end
