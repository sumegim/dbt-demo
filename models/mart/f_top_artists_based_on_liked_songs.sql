select 
  artist_name,
  count(distinct track_name) as featured_on_track_count,
  string_agg(track_name, ', ') as featured_on_tracks
  {# array_agg(track_name) as featured_on_tracks #}
from {{ ref("f_spotify_tracks_with_albums_artists_and_album_art") }}
{{ dbt_utils.group_by(1) }}
order by featured_on_track_count desc
