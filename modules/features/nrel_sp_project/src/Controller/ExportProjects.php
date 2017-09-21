<?php

namespace Drupal\nrel_sp_project\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpFoundation\RedirectResponse;
use \Drupal\node\Entity\Node;
use \Drupal\file\Entity\File;
use Drupal\paragraphs\Entity\Paragraph;
use Drupal\Core\StreamWrapper\PublicStream;

/**
 * Class ExportProjects.
 */
class ExportProjects extends ControllerBase {

  /**
   * Redirect to the current project export file.   .
   */
  public function export() {
    // Redirect to the current project export file
    $redirect_url = PublicStream::baseUrl() . "/project-export.csv";
    return new RedirectResponse($redirect_url);
  }

}
