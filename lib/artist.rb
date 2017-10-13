require 'pry'
require_relative './concerns/memorable'
require_relative './concerns/ben.rb'
require_relative './concerns/paramable.rb'

class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  extend Whatnot::Whoopsie
  include Memorable::InstanceMethods
  include Paramable

  @@artists = []

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def initialize
    super
    @songs = []
  end

  def self.all
    @@artists
  end



  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end

end
