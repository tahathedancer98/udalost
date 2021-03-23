<?php

namespace udalost\backend\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  
use udalost\backend\models\Participant as Participant;

class Commentaire extends Model {
  protected $table = 'commentaire';
  protected $primaryKey = 'id';

  public function participant() {
    return $this->belongTo('Participant', 'id_participant');
  }

} 