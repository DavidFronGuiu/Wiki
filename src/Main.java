import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.*;

public class Main {
    private static final String urlConnection = "jdbc:mysql://localhost:3306/smashbros", user = "root", pwd = "";
    public static void main(String[] args) {

        preparacion();

    }

    public static void preparacion(){
        JFrame frame = new JFrame("Smash Bros Wiki");
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.setSize(800, 800);
        frame.setLayout(new BorderLayout());    //Creamos el frame

        JPanel cards = new JPanel(new CardLayout());
        frame.setContentPane(cards);    //Creamos el cardLayout



        JPanel inicio = new JPanel();
        inicio.setLayout(null);

        JScrollPane scrPane = new JScrollPane(inicio);
        scrPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        scrPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED);
        cards.add(scrPane, "Inicio"); //Creamos el layout con la pantalla de inicio

        JPanel personaje = new JPanel();
        personaje.setLayout(null);
        cards.add(personaje, "Personaje"); //Creamos el layout con el juego

        CardLayout cardLayout = (CardLayout) cards.getLayout();
        cardLayout.show(cards, "Inicio");
        Indice.index(inicio, cards, personaje);
        frame.setVisible(true);
    }
}