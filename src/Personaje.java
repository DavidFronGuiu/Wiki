import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.*;

public class Personaje {
    private static final String urlConnection = "jdbc:mysql://localhost:3306/smashbros", user = "root", pwd = "";
    public static void personaje(JPanel panel, JPanel cards, int id){
        panel.removeAll();
        panel.setBackground(Color.WHITE);
        try (Connection c = DriverManager.getConnection(urlConnection, user, pwd);) {
            Statement s = c.createStatement();
            String query = "SELECT * FROM personaje as p, saga as s, juego as j " +
                    "WHERE p.id =" + id + " AND p.id_primera_aparicion =  j.id AND j.id_saga = s.id";
            ResultSet rs = s.executeQuery(query);
            rs.next();


            ImageIcon foto = new ImageIcon(new ImageIcon(rs.getString("url_imagen")).getImage().getScaledInstance(400, 650, Image.SCALE_DEFAULT));
            JLabel imagen = new JLabel();
            imagen.setBounds(400, 50, 400, 650);
            imagen.setIcon(foto);
            panel.add(imagen);

            ImageIcon icono = new ImageIcon(new ImageIcon(rs.getString("urlImagen")).getImage().getScaledInstance(100, 100, Image.SCALE_DEFAULT));
            JLabel imagenIcon = new JLabel();
            imagenIcon.setBounds(300, 50, 100, 100);
            imagenIcon.setIcon(icono);
            panel.add(imagenIcon);

            JLabel nombre = new JLabel(rs.getString("p.Nombre"));
            nombre.setBounds(50, 50, 300, 100);
            nombre.setFont(new Font("Serif", Font.PLAIN, 52));
            panel.add(nombre);

            JTextArea nombreJuego = new JTextArea("Primera aparición: " + rs.getString("j.Nombre"));
            nombreJuego.setBounds(50, 200, 300, 100);
            nombreJuego.setFont(new Font("Serif", Font.PLAIN, 22));
            nombreJuego.setLineWrap(true);
            panel.add(nombreJuego);


            ImageIcon portada = new ImageIcon(rs.getString("j.urlImagen"));
            if(portada.getImage().getHeight(null)>portada.getImage().getWidth(null)){
                portada = new ImageIcon(portada.getImage().getScaledInstance(250, 500, Image.SCALE_DEFAULT));
            }else{
                portada = new ImageIcon(portada.getImage().getScaledInstance(500, 250, Image.SCALE_DEFAULT));
            }
            JLabel portadaImage = new JLabel();
            portadaImage.setBounds(100, 300, 500, 500);
            portadaImage.setIcon(portada);
            panel.add(portadaImage);


            JLabel flechaIzq = new JLabel();
            ImageIcon imageIcon = new ImageIcon(new ImageIcon("./src/assets/flechaIzq.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT));
            flechaIzq.setIcon(imageIcon);
            flechaIzq.setBounds(0, 700, 100, 100);
            panel.add(flechaIzq);

            flechaIzq.addMouseListener(new MouseAdapter()
            {
                public void mouseClicked(MouseEvent e)
                {
                    CardLayout cardLayout = (CardLayout) cards.getLayout();
                    cardLayout.show(cards, "Inicio");
                }
            });

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
