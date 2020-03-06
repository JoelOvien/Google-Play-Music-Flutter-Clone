import 'package:google_play_music_flutter_clone/utils/flute_music_player.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:google_play_music_flutter_clone/data/database/sql_database_client.dart';
import 'package:google_play_music_flutter_clone/repository/albums_repository.dart';
import 'package:mockito/mockito.dart';


class MockSqlDbClient extends Mock implements SqlDbClient{}
 


void main(){

  AlbumRepositoryImpl albumRepositoryImpl;
  MockSqlDbClient mockSqlDbClient;



  setUp(() {
  mockSqlDbClient = MockSqlDbClient();
  albumRepositoryImpl = AlbumRepositoryImpl(sqlDbClient: mockSqlDbClient);
});



  group('Album Queries', (){

    Song song1 = Song(1,'Brymo','Love Me','X',1,230,"uri/uri","albumArt/albumrt",'pop');
    Song song2 = Song(2,'Fela','Hate Me','NO WONDER',2,300,"uri/uri","albumArt/albumrt",'Afro pop');
    final  tSongList = [song1,song2];

    test(
      'should return a list of song objects when call to fetchAlbum is successful',
      () async{
        //arrange
        when(albumRepositoryImpl.fetchAlbum())
              .thenAnswer((_) async => tSongList );
        //act
        final result = await albumRepositoryImpl.fetchAlbum();

        //assert
        verify(albumRepositoryImpl.fetchAlbum());
          expect(result, equals(tSongList));

      }
    );



    test(
      'should return a list of song objects when call to fetchRandomAlbum is successful',
      () async{
        //arrange
        when(albumRepositoryImpl.fetchRandomAlbum())
              .thenAnswer((_) async => tSongList );
        //act
        final result = await albumRepositoryImpl.fetchRandomAlbum();

        //assert
        verify(albumRepositoryImpl.fetchRandomAlbum());
          expect(result, equals(tSongList));

      }
    );

  });
}


