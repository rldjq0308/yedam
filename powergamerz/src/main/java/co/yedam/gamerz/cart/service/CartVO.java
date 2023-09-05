package co.yedam.gamerz.cart.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private int itemId;
	private int cartTotal;
	private String cartPersonal;
}
