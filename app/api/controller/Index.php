<?php
namespace app\api\controller;

use app\api\common\controller\Api;
use hg\apidoc\annotation as Apidoc;

/**
<<<<<<< HEAD
 * @Apidoc\Title("基础示例")
=======
 * @Apidoc\Title("controller")
>>>>>>> a45c881b3f81953d04d8835ae8f7848ae0d62289
 * @Apidoc\Group("api")
 */
class Index extends Api
{
    protected $noNeedLogin = ['*'];
<<<<<<< HEAD

    /** function index1()
     * @Apidoc\Title("")
     * @Apidoc\Desc("")
     * @Apidoc\Url("/api/Index/index1")
     * @Apidoc\Method("POST")
     * @Apidoc\Tag("tag")
     * @Apidoc\Header(ref="auth")
     * @Apidoc\Param(ref="pagingParam")
     * @Apidoc\Param("param",type="string",require=true,desc="param")
     * @Apidoc\Returned(ref="pagingParam")
     * @Apidoc\Returned("returned",type="string",desc="returned")
     * @Apidoc\Returned("data",type="array",ref="\app\api\model\User\getFieldsDesc")
     * NotParse
     */
    public function index1()
    {

        $result =
            [

        ];

        $res = \app\api\model\User::where(['name' => input('name'), '' => input('')])->whereOr(['qq' => input('qq')])->update($result);

        $this->success('ok');
    } // function index1()111()
    /** function index1111111()
     * @Apidoc\Title("")
     * @Apidoc\Desc("")
     * @Apidoc\Url("/api/Index/index1111111")
     * @Apidoc\Method("POST")
     * @Apidoc\Tag("tag")
     * @Apidoc\Header(ref="auth")
     * @Apidoc\Param(ref="pagingParam")
     * @Apidoc\Param("param",type="string",require=true,desc="param")
     * @Apidoc\Returned(ref="pagingParam")
     * @Apidoc\Returned("returned",type="string",desc="returned")
     * @Apidoc\Returned("data",type="array",ref="\app\api\model\User\getFieldsDesc")
     * NotParse
     */
    public function index1111111()
    {

        $result =
            [

        ];

        $res = \app\api\model\User::where(['name' => input('name'), '' => input('')])->whereOr(['qq' => input('qq')])->update($result);

        $this->success('ok');
    } // function index1111111()222222222()
    /** function index1222222222222()
     * @Apidoc\Title("")
     * @Apidoc\Desc("")
     * @Apidoc\Url("/api/Index/index1222222222222")
     * @Apidoc\Method("POST")
     * @Apidoc\Tag("tag")
     * @Apidoc\Header(ref="auth")
     * @Apidoc\Param(ref="pagingParam")
     * @Apidoc\Param("param",type="string",require=true,desc="param")
     * @Apidoc\Returned(ref="pagingParam")
     * @Apidoc\Returned("returned",type="string",desc="returned")
     * @Apidoc\Returned("data",type="array",ref="\app\api\model\User\getFieldsDesc")
     * NotParse
     */
    public function index1222222222222()
    {

        $result =
            [

        ];

        $res = \app\api\model\User::where(['name' => input('name'), '' => input('')])->whereOr(['qq' => input('qq')])->update($result);

        $this->success('ok');
    } // function index1222222222222()2222222221()
    /** function index12222222222221()
     * @Apidoc\Title("")
     * @Apidoc\Desc("")
     * @Apidoc\Url("/api/Index/index12222222222221")
     * @Apidoc\Method("POST")
     * @Apidoc\Tag("tag")
     * @Apidoc\Header(ref="auth")
     * @Apidoc\Param(ref="pagingParam")
     * @Apidoc\Param("param",type="string",require=true,desc="param")
     * @Apidoc\Returned(ref="pagingParam")
     * @Apidoc\Returned("returned",type="string",desc="returned")
     * @Apidoc\Returned("data",type="array",ref="\app\api\model\User\getFieldsDesc")
     * NotParse
     */
    public function index12222222222221()
    {

        $result =
            [

        ];

        $res = \app\api\model\User::where(['name' => input('name'), '' => input('')])->whereOr(['qq' => input('qq')])->update($result);

        $this->success('ok');
    } // function index12222222222221()

    /** function index122222222222211111()
     * @Apidoc\Title("")
     * @Apidoc\Desc("")
     * @Apidoc\Url("/api/Index/index122222222222211111")
     * @Apidoc\Method("POST")
     * @Apidoc\Tag("tag")
     * @Apidoc\Header(ref="auth")
     * @Apidoc\Param(ref="pagingParam")
     * @Apidoc\Param("param",type="string",require=true,desc="param")
     * @Apidoc\Returned(ref="pagingParam")
     * @Apidoc\Returned("returned",type="string",desc="returned")
     * @Apidoc\Returned("data",type="array",ref="\app\api\model\User\getFieldsDesc")
     * NotParse
     */
    public function index122222222222211111()
    {

        $result =
            [

        ];

        $res = \app\api\model\User::where(['name' => input('name'), '' => input('')])->whereOr(['qq' => input('qq')])->update($result);

        $this->success('ok');
    } // function index122222222222211111()

    /** function test1()
     * @Apidoc\Title("")
     * @Apidoc\Desc("")
     * @Apidoc\Url("/api/Index/test1")
     * @Apidoc\Method("POST")
     * @Apidoc\Tag("tag")
     * @Apidoc\Header(ref="auth")
     * @Apidoc\Param(ref="pagingParam")
     * @Apidoc\Param("param",type="string",require=true,desc="param")
     * @Apidoc\Returned(ref="pagingParam")
     * @Apidoc\Returned("returned",type="string",desc="returned")
     * @Apidoc\Returned("data",type="array",ref="\app\api\model\User\getFieldsDesc")
     * NotParse
     */
    public function test1()
    {

        $result =
            [

        ];

        $res = \app\api\model\User::where(['name' => input('name'), 'title' => input('title')])->whereOr(['qq' => input('qq'), 'test' => input('test')])->update($result);

        $this->success('ok');
    } // function test1()

    /** function test()
     * @Apidoc\Title("")
     * @Apidoc\Desc("")
     * @Apidoc\Url("/api/Index/test")
     * @Apidoc\Method("POST")
     * @Apidoc\Tag("tag")
     * @Apidoc\Header(ref="auth")
     * @Apidoc\Param(ref="pagingParam")
     * @Apidoc\Param("param",type="string",require=true,desc="param")
     * @Apidoc\Returned(ref="pagingParam")
     * @Apidoc\Returned("returned",type="string",desc="returned")
     * @Apidoc\Returned("data",type="array",ref="\app\api\model\User\getFieldsDesc")

     */
    public function test()
    {

        $result =
            [

        ];

        $res = \app\api\model\User::where(['name' => input('name'), 'title' => input('title')])->whereOr(['qq' => input('qq'), 'test' => input('test'), 'a' => input('a')])->update($result);

        $this->success('ok');
    } // function test()

 

 

	/** function bugGoogs()
	    * @Apidoc\Title("购买商品")
	    * @Apidoc\Desc("购买商品接口")
	    * @Apidoc\Url("/api/Index/bugGoogs")
	    * @Apidoc\Method("POST")
	    * @Apidoc\Tag("tag")
	    * @Apidoc\Header(ref="auth")
	    * @Apidoc\Param(ref="pagingParam")
	    * @Apidoc\Param("param",type="string",require=true,desc="param")
	    * 
	    * 
	    * @Apidoc\Returned("data",type="array",ref="\app\api\model\User\getFieldsDesc")
	    
	*/
	public function bugGoogs()
	{
	    $result = $this->validate(
            [
                'type'=>input('type'),
			
            ],
            [
                'type'=>'require',
			
            ],
            [
                'type'=>'类型不能为空',
			
            ]
        );
        if (true !== $result) {
            // 验证失败 输出错误信息
            $this->error($result);
        }
                        
		$result =
            [
                'type'=>input('type'),
			
            ];
            
		$res = \app\api\model\User::insert($result);
            
		$this->success('ok');
	} // function bugGoogs()
    


















	/** function index()
	    * @Apidoc\Title("")
	    * @Apidoc\Desc("")
	    * @Apidoc\Url("/api/Index/index")
	    * @Apidoc\Method("POST")
	    * @Apidoc\Tag("tag")
	    * @Apidoc\Header(ref="auth")
	    * 
	    
	    * 
	    * 
	    * @Apidoc\Returned("data",type="array",ref="\app\api\model\TestUser\getFieldsDesc")
	    
	*/
	public function index()
	{
	    
                        
		$result =
            [
                
            ];
            
		
        try {
            $res = \app\api\model\TestUser::with(['TestUser'	=> function($query) {
                    $query->field('');
                }])->where(['name'=>input('name'),])->find();
        }catch (\Exception $e){
            $this->error($e->getMessage());
        }
        
            
		$this->success('ok',$model_path);
	} // function index()

}
=======
    protected $noNeedRight = '*';

}
>>>>>>> a45c881b3f81953d04d8835ae8f7848ae0d62289
