//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Shop
{
    using System;
    using System.Collections.Generic;
    
    public partial class Заявки
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Заявки()
        {
            this.Продукция = new HashSet<Продукция>();
        }
    
        public long id_заявки { get; set; }
        public string Приоритет { get; set; }
        public string Статус { get; set; }
        public long id_пользователя { get; set; }
        public long id_поставщика { get; set; }
    
        public virtual Пользователи Пользователи { get; set; }
        public virtual Поставщик Поставщик { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Продукция> Продукция { get; set; }
    }
}
