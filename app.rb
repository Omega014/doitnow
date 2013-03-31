<<<<<<< HEAD
=======
# coding: utf-8
>>>>>>> 3dccd7936f6ab04535c055f1d2046d2952e7f1b5
require 'sinatra'
require 'haml'
require 'cairo'
require 'tempfile'

<<<<<<< HEAD

#require 'sinatra/reloader'
#  if development?
#end
=======
>>>>>>> 3dccd7936f6ab04535c055f1d2046d2952e7f1b5
configure :development do
  require 'pry'
  require 'sinatra/reloader'
end

get '/' do
  @title = 'Do it now!'
  haml :index
end


get '/doitnow' do
  # binding.pry

  @title = 'Do it now!'

  w = 420
  h = 400


  surface = Cairo::ImageSurface.new(w, h)
  context = Cairo::Context.new(surface)

  context.set_source_rgb(0, 0, 0)
  context.rectangle(0, 200, w, h)
  context.fill
  #Put a Mr.hayashi's face
  surface2 = Cairo::ImageSurface.from_png('views/0.png')
  context.select_font_face("meiryob.ttc")
  context.set_source(surface2, 0, 0)
  context.paint
  #Put a string
  context.set_source_rgb(25, 255, 255)
  context.font_size = 25
  context.move_to(20, 380)
  #context.show_text('「'+params[:url]+'」')
  context.show_text(params[:url])

<<<<<<< HEAD

=======
>>>>>>> 3dccd7936f6ab04535c055f1d2046d2952e7f1b5
  #Drawing background-color(Black)
  tmpfile = Tempfile.new(["hayashi", ".png"])
  surface.write_to_png(tmpfile.path)
  tmpfile.open # reopen

  #Render png binary content
  content_type :png
  tmpfile.read
<<<<<<< HEAD
  end
=======
end
>>>>>>> 3dccd7936f6ab04535c055f1d2046d2952e7f1b5


helpers do
  def add_schema(url)
    if url !~ /^https?/
      if url =~ /\/\//
        "http:#{url}"
      else
        "http://#{url}"
      end
    else
      url
    end
  end
end
