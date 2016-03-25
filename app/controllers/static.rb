
get '/' do
   erb :"static/index"
 end
#gets index page from static folder

#when click submit, data sent to backend. 
#post is used for when you want to change things
post '/urls' do
    # short_url = Url.shorten(params[:long_url]) -=  cant run shorten as it is an instance method
    url = Url.create(long_url: params[:long_url])
    url.save
    redirect "/" # => redirect to line 3
	#create a new Url
end

#i.e. /a7hh2
get '/:short_url' do
    url = Url.find_by(short_url: params[:short_url])
    url.update(counter: url.counter + 1)
    redirect url.long_url
 # redirect to appropriate "long" URL
end


 
