
package main ;


import javafx.application.Application ;
import javafx.fxml.FXMLLoader ;
import javafx.scene.Scene ;
import javafx.stage.Stage ;
import java.io.IOException ;



public class Main extends Application {


	@Override
    public void start ( Stage stage_01 ) throws IOException {
		
    	FXMLLoader fxmlLoader_01 = new FXMLLoader (getClass().getResource("../resources/Primary_FXML_Interface.fxml")) ;
    	Scene scene_01 = new Scene (fxmlLoader_01.load(),600,400) ;
    	stage_01.setScene (scene_01) ;
    	stage_01.show() ;
    	stage_01.setTitle ("Main project") ;
    	stage_01.setResizable (true) ;
        
    }

	public static void main ( String[] args ) {  launch();  }


}
