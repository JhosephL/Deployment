
// PACKAGE
package main ;


// IMPORTS
import javax.swing.* ;



/* MAIN CLASS IMPLEMENTATION */

public class Main {

	// @param args the command line arguments


	public static void main ( String[] args ) {

		javax.swing.SwingUtilities.invokeLater ( Main::createAndShowGUI ) ;
		
	}
	
	private static void createAndShowGUI ( ) {
		
		JFrame frame = new JFrame ( "Main" ) ;
		frame.setDefaultCloseOperation ( JFrame.EXIT_ON_CLOSE ) ;

		JLabel label = new JLabel ( "Hello, Swing!" ) ;
		frame.getContentPane().add ( label ) ;

		frame.pack() ;
		frame.setVisible ( true ) ;
	
	}


}


// To rest --->-->->    