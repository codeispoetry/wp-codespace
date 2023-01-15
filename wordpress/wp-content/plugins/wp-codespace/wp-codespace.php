<?php
/**
 * This plugin is just for demonstrating.
 *
 * @package WP_Codespace
 * @version 1.0.0
 */

/*
Plugin Name: WP Codespace
Description: This plugin is just for demonstrating.
Author: Tom Rose
*/


/**
 * Adds a Hello Codespace to the admin area.
 */
function wp_codespace_notices() {
	echo '<p class="wp-codespace">Hello codespace!</p>';
}
add_action( 'admin_notices', 'wp_codespace_notices' );

/**
 * Register and enqueue a stylesheet in admin.
 */
function wp_codespace_enqueue_admin_style() {
		wp_register_style( 'wp_codespace_admin_style', plugin_dir_url( __FILE__ ) . 'styles.css', false, '1.0.0' );
		wp_enqueue_style( 'wp_codespace_admin_style' );
}
add_action( 'admin_enqueue_scripts', 'wp_codespace_enqueue_admin_style' );
