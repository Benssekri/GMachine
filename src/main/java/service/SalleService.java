package service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Machine;
import beans.Salle;
import connexion.Connexion;

public class SalleService {

	public boolean create(Salle s) {
		String sql = "insert into salle values (null, ?,?)";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, s.getCode());
			ps.setString(2, s.getType());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("create : erreur sql : " + e.getMessage());

		}
		return false;
	}

	 public boolean delete(Salle s) {
	        String sql = "delete from salle where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, s.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("delete : erreur sql : " + e.getMessage());

	        }
	        return false;
	    }

	public boolean update(Salle s) {

		String sql = "update salle set code  = ? , type =? where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, s.getCode());
			ps.setString(2, s.getType());
			ps.setInt(3, s.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}

	public Salle findById(int id) {
		Salle s = null;
		String sql = "select * from salle where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("type"));
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return null;
	}

	public List<Salle> findAll() {
		List<Salle> salles = new ArrayList<Salle>();

		String sql = "select * from salle order by id desc";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				salles.add(new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("type")));
			}

		} catch (SQLException e) {
			System.out.println("findAll " + e.getMessage());
		}
		return salles;
	}

	public List<Salle> findSalleByCode(String cod) {
		List<Salle> salles = new ArrayList<Salle>();

		String sql = "select * from salle where code =  ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			;
			ps.setString(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				salles.add(new Salle(rs.getInt("id"), rs.getString("code"), rs.getString("type")));
			}

		} catch (SQLException e) {
			System.out.println("findAll " + e.getMessage());
		}
		return salles;
	}

}
