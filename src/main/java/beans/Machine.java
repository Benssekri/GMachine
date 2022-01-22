package beans;

import java.util.Date;

public class Machine {

	private int id;
	private String reference;
	private Date dateAchat;
	private double prix;
	private String marque;
	private Salle salle;
	private static int comp;

	public Machine(String reference, Date dateAchat, double prix, String marque, Salle salle) {
		this.id = ++comp;
		this.reference = reference;
		this.dateAchat = dateAchat;
		this.prix = prix;
		this.marque = marque;
		this.salle = salle;
	}

	public Machine(int id, String reference, Date dateAchat, double prix, String marque, Salle salle) {
		this.id = id;
		this.reference = reference;
		this.dateAchat = dateAchat;
		this.prix = prix;
		this.marque = marque;
		this.salle = salle;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public Date getDateAchat() {
		return dateAchat;
	}

	public void setDateAchat(Date dateAchat) {
		this.dateAchat = dateAchat;
	}

	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public String getMarque() {
		return marque;
	}

	public void setMarque(String marque) {
		this.marque = marque;
	}

	public Salle getSalle() {
		return salle;
	}

	public void setSalle(Salle salle) {
		this.salle = salle;
	}

	@Override
	public String toString() {
		return this.id + " " + this.reference;
	}

}
