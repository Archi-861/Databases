from __future__ import annotations

class Album:

    def __init__(self, name: str, artist: str, tracks=None):

        self.__name = name
        self.__artist = artist
        self.__tracks = tracks or []



    def add_track(self, track: Track):

        if not isinstance(track, Track):
            print('Трек должен быть объектом класса Track')
            return False

        self.__tracks.append(track)



    def remove_track(self, track_title: str):

        if not isinstance(track_title, str):
            print('Track_title должен быть строкой')
            return False

        for track in self.__tracks:
            if track.get_title() == track_title:
                self.__tracks.remove(track)
                return True
        print('Такого трека нет в списке\n')
        return False



    def get_name(self):
        return self.__name

    def get_artist(self):
        return self.__artist

    def get_tracks(self):
        return self.__tracks



    def __str__(self):

        if len(self.__tracks) == 0:
            tracks = 'Треков нет'

        else:
            tracks = '\n '.join(str(track) for track in self.__tracks)

        track_info = (f'Название альбома:  {self.__name};\n'
                      f'Имя исполнителя: {self.__artist};\n'
                      f'Треки: {tracks}.')


        return track_info


class Track:

    title: str
    duration: float

    def __init__(self, title: str, duration: float):

        if not isinstance(title, str):
            raise TypeError('Название трека должно быть строкой')

        if not isinstance(duration, float) or duration <= 0:
            raise TypeError('Продолжительность должна быть положительным числом')

        self.__title = title
        self.__duration = duration



    def get_title(self):
        return self.__title

    def get_duration(self):
        return self.__duration


    def set_title(self, new_title: str):

        if not isinstance(new_title, str):
            print('Новое название трека должно быть строкой')
            return False

        self.__title = new_title

    def set_duration(self, new_duration: float):

        if not isinstance(new_duration, float) or new_duration <= 0:
            print('Новая продолжительность трека должна быть положительным числом числом')
            return False

        self.__duration = new_duration



    def __str__(self):
        return (f'Название трека - {self.__title};\n'
                f'Продолжительность трека - {self.__duration}мин.\n')


album = Album('First', 'AC/DC')

track_1 = Track('TNT', 3.50)
track_2 = Track('Highway to hell', 3.10)
track_3 = Track('Believe', 5.00)

album.add_track(track_1)
album.add_track(track_2)

print(album)
print(track_2)

album.remove_track('Believe')
album.remove_track('TNT')
print(album)