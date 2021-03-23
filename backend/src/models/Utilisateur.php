<?php

namespace udalost\backend\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  
use udalost\backend\models\Evenement as Evenement;

class Utilisateur extends Model {
  protected $table = 'utilisateur';
  protected $primaryKey = 'id';

  	public function evenements() {
		return $this->belongsToMany('Evenement',
	           						'participant',
	           						'id_utilisateur',
	        						'id_evenement')
					->withPivot(['id','nom','status','message','id_evenement','id_utilisateur']);
	}
} 