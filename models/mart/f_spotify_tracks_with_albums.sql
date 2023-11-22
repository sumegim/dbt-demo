{{ config(materialized='table') }}

select 
  album.name as album_name, 
  track.name as track_name,
from {{ source('spotify', 'My_top_Tracks') }} track
left join {{ source('spotify', 'My_top_Tracks_album') }} album on
  track._airbyte_my_top_tracks_hashid = album._airbyte_my_top_tracks_hashid
order by album.name