<?php

namespace udalost\backoffice\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  

class Commentaire extends Model {
  protected $table = 'commentaire';
  protected $primaryKey = 'id';

  public function participant() {
    return $this->belongsTo('udalost\backoffice\models\Participant', 'id_participant');
  }
} 