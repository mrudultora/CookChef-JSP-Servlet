package com.cookchef.web;

import java.util.Random;

public class RandomString {
	public static String generate() {
		String bag = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		Random rand = new Random();
		StringBuilder res = new StringBuilder();
		for (int i = 0; i < 7; i++) {
			int randIndex = rand.nextInt(bag.length());
			res.append(bag.charAt(randIndex));
		}
		return res.toString() + "_";
	}
}
