<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\taxonomy\Entity\Term;

/**
 * Provides a 'TermInfo' block.
 *
 * @Block(
 *  id = "term_info",
 *  admin_label = @Translation("Term info"),
 * )
 */
class TermInfo extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {

    $parameters = \Drupal::routeMatch()->getParameters();
    $tid = ($parameters->get('arg_0'));

    $term = \Drupal\taxonomy\Entity\Term::load($tid);

    $field_image_caption = $term->get('field_image_caption')->getValue();
    $file_image = $term->get('field_image');
    $file = $file_image->referencedEntities();
    $uri = $file[0]->getFileUri();

    $image = [
      '#theme' => 'image',
      '#uri' => $uri,
    ];
    $renderer = \Drupal::service('renderer');
    $themed_image_html = render($image);

    $build = [];
    $build['term_info']['#markup'] = $themed_image_html;
    $build['term_info']['#markup'] .= '<p>' . $field_image_caption[0]['value'] . '</p>';

    return $build;
  }

}
