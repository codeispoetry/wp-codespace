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


add_action( 'admin_notices', 'wp_codespace_notices' );
/**
 * Adds a Hello Codespace to the admin area.
 */
function wp_codespace_notices() {
	echo '<p>Hello codespace!</p>';
}
