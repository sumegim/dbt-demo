select 
  artist.name as artist_name, 
  album.name as album_name, 
  track.name as track_name,
  images.url as image_url
from {{ source('spotify', 'My_top_Tracks') }} track
left join {{ source('spotify', 'My_top_Tracks_album') }} album on
  track._airbyte_my_top_tracks_hashid = album._airbyte_my_top_tracks_hashid
left join {{ source('spotify', 'My_top_Tracks_artists') }} artist on
  track._airbyte_my_top_tracks_hashid = artist._airbyte_my_top_tracks_hashid
left join {{ source('spotify', 'My_top_Tracks_album_images') }} images on
  album._airbyte_album_hashid = images._airbyte_album_hashid
  and images.width = 300
order by artist.name