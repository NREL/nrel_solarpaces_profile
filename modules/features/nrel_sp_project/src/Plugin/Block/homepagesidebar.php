<?php

namespace Drupal\nrel_sp_project\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'homepagesidebar' block.
 *
 * @Block(
 *  id = "homepagesidebar",
 *  admin_label = @Translation("Homepagesidebar"),
 * )
 */
class homepagesidebar extends BlockBase {


  /**
   * {@inheritdoc}
   */
  public function defaultConfiguration() {
    return [
         'text' => $this->t('<h3>SolarPACES Snapshot</h3><p><a href="http://www.solarpaces.org/">SolarPACES</a>, an international program of the <a href="http://www.iea.org/">International Energy Agency</a>, furthers collaborative development, testing, and marketing of concentrating solar power plants. Activities include testing large-scale systems and developing advanced technologies, components, instrumentation, and analysis techniques.</p><p>Founded in 1977, SolarPACES now has 13 members: Algeria, Australia, Egypt, the European Commission, France, Germany, Israel, Mexico, South Africa, South Korea, Spain, Switzerland, and the United States.</p>'),
        ] + parent::defaultConfiguration();

 }

  /**
   * {@inheritdoc}
   */
  public function blockForm($form, FormStateInterface $form_state) {
    $form['text'] = [
      '#type' => 'text_format',
      '#title' => $this->t('Text'),
      '#description' => $this->t(''),
      '#default_value' => $this->configuration['text']['value'],
      '#weight' => '0',
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function blockSubmit($form, FormStateInterface $form_state) {
    $this->configuration['text'] = $form_state->getValue('text');
  }

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $build['homepagesidebar_text']['#markup'] = '<p>' . $this->configuration['text']['value'] . '</p>';

    return $build;
  }

}
