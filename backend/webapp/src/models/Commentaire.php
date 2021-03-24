<?php

namespace udalost\webapp\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  
use udalost\webapp\models\Participant as Participant;

class Commentaire extends Model {
  protected $table = 'commentaire';
  protected $primaryKey = 'id';

  public function participant() {
    return $this->belongsTo('Participant', 'id_participant');
  }
} 