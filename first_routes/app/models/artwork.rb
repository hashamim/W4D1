# == Schema Information
#
# Table name: artworks
#
#  id        :bigint(8)        not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord

    # one artist_id cannot have two artworks with same 
    # name

    # different artists can have artworks with same name

     validates :title, presence: true, uniqueness: { 
        scope: :artist_id, message: 'artist cannot have works with same name'
    }

    
    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User
   
    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare
     has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
end
