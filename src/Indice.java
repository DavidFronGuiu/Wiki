import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.*;

public class Indice {
    private static final String urlConnection = "jdbc:mysql://localhost:3306/smashbros", user = "root", pwd = "";
    public static void index(JPanel panel, JPanel cards, JPanel personaje){
        panel.setBackground(Color.WHITE);
        try (Connection c = DriverManager.getConnection(urlConnection, user, pwd);) {
            Statement s = c.createStatement();
            String query = "SELECT * FROM personaje";
            ResultSet rs = s.executeQuery(query);

           /* GridBagConstraints gbc = new GridBagConstraints();
            gbc.gridwidth = GridBagConstraints.REMAINDER;*/

            JLabel prueba = new JLabel("Hola");
            prueba.setBounds(100, 800, 100, 100);
            panel.add(prueba);

            int posx = 100;
            int posy = 100;
            while (rs.next()) {
                String nombreString = rs.getString("Nombre");
                int id = Integer.parseInt(rs.getString("id"));
                ImageIcon foto = new ImageIcon(new ImageIcon(rs.getString("url_imagen")).getImage().getScaledInstance(100, 180, Image.SCALE_DEFAULT));
                JLabel imagen = new JLabel();
                imagen.setBounds(posx, posy+50, 100, 200);
                imagen.setIcon(foto);

                JLabel nombre = new JLabel(nombreString);
                nombre.setBounds(posx, posy, 100, 100);
                nombre.setHorizontalAlignment(SwingConstants.CENTER);
                nombre.addMouseListener(new MouseAdapter() {
                    @Override
                    public void mouseClicked(MouseEvent e) {
                        CardLayout cardLayout = (CardLayout) cards.getLayout();
                        cardLayout.show(cards, "Personaje");
                        Personaje.personaje(personaje, cards, id);
                    }
                });

                panel.add(nombre);
                panel.add(imagen);
                posx +=150;

                if(posx>=700){
                    posx=100;
                    posy += 200;
                }

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
